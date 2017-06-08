# Copyright 2017 Cisco Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


$:.unshift(*Dir[::File.expand_path('./../../', File.dirname(__FILE__))])

require 'imccoreutils'
#
# This method returns the virtual drive name by raid_level and drive_list
#
# @param raid_level [Integer] raid level ex. 0, 1, 5, 6, 10, 50, 60
#                       Raid 0 Simple striping.
#                       Raid 1 Simple mirroring.
#                       Raid 5 Striping with parity.
#                       Raid 6 Striping with two parity drives.
#                       Raid 10 Spanned mirroring.
#                       Raid 50 Spanned striping with parity.
#                       Raid 60 Spanned striping with two parity drives.
# @param drive_group [Array<Array>] list of drives
#                        [[1]]
#                        [[1,2]]
#                        [[1,2],[3,4]]
# @return [string] 
def vd_name_derive(raid_level, drive_list)
    return "RAID" + raid_level.to_s + "_" + _flatten_to_string(drive_list)
end

#
# This method queries the virtual drive by name
#
# @param handle [ImcHandle] ImcHandle class object
# @param controller_type [String] Controller type ex. 'SAS'
# @param controller_slot [String] Controller slot name/number ex. "MEZZ","0"-"9", "HBA"
# @param virtual_drive_name [String] Name of the virtual drive
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [StorageVirtualDrive] if virtual drive found.
# @return [nil] if virtual drive not found.
#
def vd_query_by_name(handle:, controller_type:, controller_slot:, virtual_drive_name:, server_id: 1)
    slot_dn = _get_controller_dn(handle, controller_type, controller_slot, server_id)

    mos = handle.query_children(in_dn: slot_dn, class_id: "storageVirtualDrive")
    for mo in mos
        if mo.name == virtual_drive_name
            return mo
        end
    end
    return nil
end

#
# Set drive as the boot drive
#
# @param handle [ImcHandle] ImcHandle class object
# @param controller_type [String] Controller type ex. 'SAS'
# @param controller_slot [String] Controller slot name/number ex. "MEZZ","0"-"9", "HBA"
# @param virtual_drive_name [String] Name of the virtual drive
# @param raid_level [Integer] raid level ex. 0, 1, 5, 6, 10, 50, 60
#                       Raid 0 Simple striping.
#                       Raid 1 Simple mirroring.
#                       Raid 5 Striping with parity.
#                       Raid 6 Striping with two parity drives.
#                       Raid 10 Spanned mirroring.
#                       Raid 50 Spanned striping with parity.
#                       Raid 60 Spanned striping with two parity drives.
# @param drive_group [Array<Array>] list of drives
#                        [[1]]
#                        [[1,2]]
#                        [[1,2],[3,4]]
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [nil]
#
def set_as_boot_drive(handle:,
                    controller_type:,
                    controller_slot:,
                    virtual_drive_name: nil,
                    raid_level: nil,
                    drive_group: nil,
                    server_id: 1)

    vd_name = virtual_drive_name
    if vd_name.nil?
        vd_name = vd_name_derive(raid_level,drive_group)
    end
	vd = vd_query_by_name(handle: handle,
                        controller_type: controller_type,
 			            controller_slot: controller_slot,
 			            virtual_drive_name: vd_name,
 			            server_id: server_id)
    vd.set_prop(:admin_action,"set-boot-drive")
    handle.set_mo(mo: vd)
end

#
# Checks if a virtual drive by the specified name exists.
#
# @param handle [ImcHandle] ImcHandle class object
# @param controller_type [String] Controller type ex. 'SAS'
# @param controller_slot [String] Controller slot name/number ex. "MEZZ","0"-"9", "HBA"
# @param virtual_drive_name [String] Name of the virtual drive
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [TrueClass, StorageVirtualDrive] if virtual drive exists.
# @return [FalseClass, nil] if virtual drive doesn't exist.
#
def virtual_drive_exists(handle:,
                         controller_type:,
                         controller_slot:,
                         virtual_drive_name:,
                         server_id: 1)
    mo = vd_query_by_name(handle: handle, controller_type: controller_type, controller_slot: controller_slot,
                          virtual_drive_name: virtual_drive_name, server_id: server_id)
    return !mo.nil?, mo
end

#
# Deletes the specified virtual drive
#
# @param handle [ImcHandle] ImcHandle class object
# @param controller_type [String] Controller type ex. 'SAS'
# @param controller_slot [String] Controller slot name/number ex. "MEZZ","0"-"9", "HBA"
# @param virtual_drive_name [String] Name of the virtual drive
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @example
#   virtual_drive_delete(handle: imc,
#                        controller_slot: 'MEZZ',
#                        virtual_drive_name: "RAID0_1")
#
def virtual_drive_delete(handle:,
                         controller_type:,
                         controller_slot:,
                         virtual_drive_name:,
                         server_id: 1)
    vd = vd_query_by_name(handle: handle,
                          controller_type: controller_type,
                          controller_slot: controller_slot,
                          virtual_drive_name: virtual_drive_name,
                          server_id: server_id)
    handle.remove_mo(mo: vd)
end

#
# Creates virtual drive from unused physical drives
#
# @param handle [ImcHandle] ImcHandle class object
# @param drive_group [Array<Array>] list of drives
#                        [[1]]
#                        [[1,2]]
#                        [[1,2],[3,4]]
# @param controller_type [String] Controller type ex. 'SAS'
# @param controller_slot [String] Controller slot name/number ex. "MEZZ","0"-"9", "HBA"
# @param virtual_drive_name [String] Name of the virtual drive
# @param raid_level [Integer] raid level ex. 0, 1, 5, 6, 10, 50, 60
#                       Raid 0 Simple striping.
#                       Raid 1 Simple mirroring.
#                       Raid 5 Striping with parity.
#                       Raid 6 Striping with two parity drives.
#                       Raid 10 Spanned mirroring.
#                       Raid 50 Spanned striping with parity.
#                       Raid 60 Spanned striping with two parity drives.
# @param access_policy [String] Access-policy for the virtual drive, ex. ['read-write', 'read-only', 'hidden', 'default', 'blocked']
# @param read_policy [String]
# @param disk_cache_policy [String]
# @param write_policy [String]
# @param strip_size [String]
# @param size
# @param self_encrypt [TrueClass, FalseClass] encrypt the virtual drive if the underlying controller and physical drive support it
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [StorageVirtualDrive]
#
# @example
#   virtual_drive_create(handle: imcHandle,
#                       drive_group: [[2]],
#                       controller_slot: 'MEZZ')
#
def virtual_drive_create(handle:,
                         drive_group:,
                         controller_type:,
                         controller_slot:,
                         raid_level: 0,
                         virtual_drive_name: nil,
                         access_policy: "read-write",
                         read_policy: "no-read-ahead",
                         cache_policy: "direct-io",
                         disk_cache_policy: "unchanged",
                         write_policy: "Write Through",
                         strip_size: "64k",
                         size: nil,
                         self_encrypt: false,
                         server_id: 1)
    slot_dn = _get_controller_dn(handle, controller_type,
                                 controller_slot, server_id)

    dg_str = _list_to_string(drive_group)
    vdn = virtual_drive_name

    params = {}
    params[:parent_mo_or_dn] = slot_dn
    params[:drive_group] = dg_str
    params[:raid_level] = raid_level.to_s
    params[:access_policy] = access_policy
    params[:read_policy] = read_policy
    params[:cache_policy] = cache_policy
    params[:disk_cache_policy] = disk_cache_policy
    params[:write_policy] = write_policy
    params[:strip_size] = strip_size

    if self_encrypt
        params[:admin_action] = "enable-self-encrypt"
    end
    params[:virtual_drive_name] = vdn.nil? ? vd_name_derive(raid_level, drive_group) : vdn

    params[:size] = size.nil? ? _vd_max_size_get(handle,
                                       controller_type,
                                       controller_slot,
                                       drive_group,
                                       raid_level,
                                       server_id) : size

    require "mometa/storage/StorageVirtualDriveCreatorUsingUnusedPhysicalDrive"
    #mo = vd_creator(**params)
    mo = StorageVirtualDriveCreatorUsingUnusedPhysicalDrive.new(**params)
    mo.set_prop(:admin_state, "trigger")
    handle.add_mo(mo: mo)
    return mo
end

#
# Gets the physical drive
#
# @param handle [ImcHandle] ImcHandle class object
# @param controller_type [String] Controller type ex. 'SAS'
# @param controller_slot [String] Controller slot name/number ex. "MEZZ","0"-"9", "HBA"
# @param drive_slot [Integer] Slot in which the drive resides
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [StorageLocalDisk]
#
# @example
#   mo = physical_drive_get(handle: imcHandle, controller_type: 'SAS',
#                           controller_slot: 'HBA',
#                           drive_slot: 4)
def physical_drive_get(handle:,
                       controller_type:,
                       controller_slot:,
                       drive_slot:,
                       server_id: 1)
    controller_dn = _get_controller_dn(handle, controller_type,
                                       controller_slot, server_id)
    drive_dn = controller_dn + '/pd-' + drive_slot.to_s
    return handle.query_dn(dn: drive_dn)
end
    

private

def _vd_max_size_get(handle,
                     controller_type,
                     controller_slot,
                     drive_list,
                     raid_level,
                     server_id=1)
=begin
    Returns the usable disk size for the specified virtual_drive
        drive_list:
            [[1]]
            [[1,2],[3,4]]
        min_size = smallest size of all the drives from this disk group
        available_size = accumulated size of all the drives together
        span_depth = number of sub groups [[1,2,3],[4,5,6]] span_depth = 2
=end
    sizes = _pd_sizes_get(handle,
                          controller_type,
                          controller_slot,
                          drive_list,
                          server_id)
    min_size = _pd_min_size_get(sizes)
    total_size = _pd_total_size_get(sizes)
    span_depth = _vd_span_depth_get(drive_list)

    max_size = _raid_max_size_get(raid_level, total_size, min_size, span_depth)
    return _bytes_to_human(max_size, "MB")
end

def _vd_span_depth_get(drive_list)
    #return len(drive_list)
    return drive_list.size
end

def _raid_max_size_get(raid_level, total_size, min_size, span_depth)
    size = {0 => total_size,
            1 => total_size/2,
            5 => total_size - (span_depth * 1 * min_size),
            6 => total_size - (span_depth * 2 * min_size),
            10 => total_size/2,
            50 => total_size - (span_depth * 1 * min_size),
            60 => total_size - (span_depth * 2 * min_size)}

    if !size.has_key?(raid_level)
        raise "Unsupported Raid level: " + raid_level.to_s
    end
    return size[raid_level]
end


def _pd_sizes_get(handle,
                  controller_type,
                  controller_slot,
                  drive_list,
                  server_id=1)
    sizes = []
    for each in drive_list
        for drive in each
            dmo = physical_drive_get(handle: handle,
                                     controller_type: controller_type,
                                     controller_slot: controller_slot,
                                     drive_slot: drive,
                                     server_id: server_id)
            sizes.push(_human_to_bytes(dmo.coerced_size))
        end
    end
    return sizes
end

def _pd_min_size_get(sizes)
    return sizes.min
end


def _pd_total_size_get(sizes)
    #return sum(sizes)
    return sizes.inject(:+)
end

def _human_to_bytes(size_str)
=begin
    returns the size in bytes
        supported formats KB, MB, GB, TB, PB, EB, ZB, YB
        KB to bytes = (* 1024) == << 10
        MB to bytes = (* 1024 * 1024) == << 20
        GB to bytes = (* 1024 * 1024 * 1024) == << 30
=end
    convert = {'KB' => 1, 'MB' => 2, 'GB' => 3, 'TB' => 4,
               'PB' => 5, 'EB' => 6, 'ZB' => 7, 'YB' => 8}
    s = size_str.split()
    if !convert.has_key?(s[1])
        raise "unknown size format" + size_str
    end
    return s[0].to_i << (10 * convert[s[1]])

end

def _bytes_to_human(size, output_format=nil)
=begin
    converts bytes to human readable format.
        The return is in output_format.
=end
    convert = {'KB' => 1, 'MB' => 2, 'GB' => 3, 'TB' => 4,
               'PB' => 5, 'EB' => 6, 'ZB' => 7, 'YB' => 8}
    unit = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
    if output_format.nil?
        #output_format = unit[int(math.floor(math.log(size, 2))/10)]
        output_format = unit[((Math.log(size, 2)).floor/10).to_i]
    end
    if !convert.has_key?(output_format)
        raise "unknown output format" + output_format
    end
    return (size >> (10 * convert[output_format])).to_s + ' ' + output_format
end

def _flatten_list(drive_list)
    # convert to format imc expects
    # [[1]] => [1]
    # [[1,2],[3,4]] => [1, 2, 3, 4]
    #if !(isinstance(drive_list, list) and isinstance(drive_list[0], list))
    if !(drive_list.is_a?(Array) and drive_list[0].is_a?(Array))
        raise "drive_list needs a list of list(s). i.e [[1,2],[3,4]]"
    end
    dg_list = []
    for each in drive_list
        for sub_each in each
            dg_list.push(sub_each)
        end
    end
    return dg_list
end

def _get_controller_dn(handle, controller_type, controller_slot, server_id=1)
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    return (server_dn + "/board/storage-" + controller_type + "-" + controller_slot)
end

def _get_controller(handle, controller_type, controller_slot, server_id=1)
    mo = handle.query_dn(_get_controller_dn(handle,
                                            controller_type,
                                            controller_slot,
                                            server_id))
    if mo.nil?
        raise ImcOperationError.new("Get Controller Type:#{controller_type} Slot: #{controller_slot}", "Managed Object not found")
    end
    return mo
end
def _flatten_to_string(drive_list)
    # convert to format imc expects
    # [[1]] => '1'
    # [[1,2],[3,4]] => '1234'
    
    flat_array = _flatten_list(drive_list)
    #for x in _flatten_list(drive_list)
    #    flat_array.push(x.to_s.join(''))
    #end
    return flat_array.join('')
    #return ''.join([''.join(x.to_s) for x in _flatten_list(drive_list)])
end

def _list_to_string(drive_list)
    # convert to format imc expects
    # list to string
    # [[1]] => '[1]'
    # [[1,2],[3,4]] => '[1,2][3,4]'
    # imc fails to parse '[1, 2]'
    # it needs to be '[1,2]'
    # and hence the replace(' ', '')
    dg_str = String.new
    for each in drive_list
        dg_str += each.to_s
    end
    #return dg_str.gsub!(' ', '')
    return dg_str.delete(' ')
end