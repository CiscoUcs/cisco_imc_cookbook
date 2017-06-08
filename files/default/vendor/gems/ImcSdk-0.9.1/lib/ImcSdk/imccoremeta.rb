# Copyright 2017 Cisco Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#This module contains all the base classes for the meta



#class WriteXmlOption < Object
module WriteXmlOption   
    #Class used as enum

    ALL = 0
    ALL_CONFIG = 1
    DIRTY = 2
end


class ImcVersion < Object

=begin
    This class handles the operations related to the ImcVersions.
    It provides the functionality to compare Imc version objects.

    Attributes:
        * version (str): version string
=end

    attr_reader :version
    attr_accessor :major
    attr_accessor :minor
    attr_accessor :mr
    attr_accessor :patch

    def initialize(version)
        
        if version.nil?
            return nil
        end

        @version = version

        match_pattern = /^(?<major>[1-9][0-9]{0,2})\.(?<minor>(([0-9])|([1-9][0-9]{0,1})))\((?<mr>(([0-9])|([1-9][0-9]{0,2})))\.(?<patch>([0-9])|([1-9][0-9]{0,4}))\)$/

        match_obj = @version.match(match_pattern)
        if match_obj
            @major, @minor, @mr, @patch = match_obj.captures
            return
        end
        match_pattern = /^(?<major>[1-9][0-9]{0,2})\.(?<minor>(([0-9])|([1-9][0-9]{0,1})))\((?<mr>(([0-9])|([1-9][0-9]{0,2})))(?<patch>[a-z])\)$/
        match_obj = @version.match(match_pattern)
        if match_obj
            @major, @minor, @mr, @patch = match_obj.captures
            return
        end
        match_pattern = /^(?<major>[1-9][0-9]{0,2})\.(?<minor>(([0-9])|([1-9][0-9]{0,1})))\((?<mr>([0-9])|([1-9][0-9]{0,2}))\)$/
        match_obj = @version.match(match_pattern)
        if match_obj
            @major, @minor, @mr = match_obj.captures
            return
        end
    end

    def compare_to(version)
        #This Method compare Imc version

        if version.nil? || !(version.is_a? ImcVersion)
            return 1
        end

        if @major != version.major
            return @major.ord - version.major.ord
        end

        if @minor != version.minor
            return @minor.ord - version.miniw.ord
        end

        if @mr != version.mr
            return @mr.ord - version.mr.ord
        end
        return @patch.ord - version.patch.ord
    end

    
    def gt(version)
        return compare_to(version) > 0
    end
    
    
    def lt(version)
        return compare_to(version) < 0
    end
    
    
    def ge(version)
        return compare_to(version) >= 0
    end
    
    
    def le(version)
        return compare_to(version) <= 0
    end

    def to_s()
        return version
    end
end

class MoPropertyRestriction < Object
=begin
    This class handles the restriction information of the properties
    of managed object.
=end

    attr_reader :min_length
    attr_reader :max_length
    attr_reader :pattern
    attr_reader :range_val
    attr_reader :value_set
    attr_reader :range_roc
    attr_reader :value_set_roc
    
    def initialize(min_length=nil, max_length=nil, pattern=nil,
                 value_set=nil, range_val=nil)
        @min_length = min_length
        @max_length = max_length
        @pattern = pattern
        @range_val = range_val
        @value_set = value_set
        @range_roc = nil
        @value_set_roc = nil
    end
end

class MoPropertyMeta < Object
=begin
    This class handles the meta information of the properties of managed
    Object.
=end

  
    attr_reader :name
    attr_reader :xml_attribute
    attr_reader :field_type
    attr_reader :version
    attr_reader :access
    attr_reader :mask
    attr_reader :restriction
    
    NAMING = 0
    CREATE_ONLY = 1
    READ_ONLY = 2
    READ_WRITE = 3
    INTERNAL = 4

    def initialize(name, xml_attribute, field_type, version, access, mask, min_length, max_length, pattern, value_set, range_val)
        @name = name
        @xml_attribute = xml_attribute
        @field_type = field_type
        @version = version
        @access = access
        @mask = mask
        @restriction = MoPropertyRestriction.new(min_length, max_length,
                                                   pattern, value_set,
                                                   range_val)
    end

    def validate_property_value(input_value)
        #validate property value of mo.

        return true
    end
    
    def to_s()

        #Method to return string representation.

        #TBD  implementation
    end

end

class MoMeta < Object
=begin
    This class handles the meta information of the managed Object.
=end

    attr_reader :name
    attr_reader :xml_attribute
    attr_reader :rn
    attr_reader :version
    attr_reader :inp_out
    attr_reader :mask
    attr_reader :field_names
    attr_reader :access
    #attr_reader :children
    #attr_reader :parents
    attr_reader :verbs
    
    ACCESS_TYPE_IO = "InputOutput"
    ACCESS_TYPE_OUTPUTONLY = "OutputOnly"

    #def initialize(name, xml_attribute, rn, version, inp_out, mask,
    #             field_names, access, parents, children, verbs)
    def initialize(name, xml_attribute, rn, version, inp_out, mask,
                 field_names, access, verbs)

        @name = name
        @xml_attribute = xml_attribute
        @rn = rn
        @version = version
        @inp_out = inp_out
        @mask = mask
        @field_names = field_names
        @access = access
        #@children = children
        #@parents = parents
        @verbs = verbs
    end
end

class MethodPropertyMeta < Object
=begin
    This class handles the meta information of the properties of
    external method Object.
=end

    attr_reader :name
    attr_reader :xml_attribute
    attr_reader :field_type
    attr_reader :version
    attr_reader :inp_out
    attr_reader :is_complex_type
    
    def initialize(name, xml_attribute, field_type, version, inp_out,
                 is_complex_type)
        @name = name
        @xml_attribute = xml_attribute
        @field_type = field_type
        @version = version
        @inp_out = inp_out
        @is_complex_type = is_complex_type
    end
end

class MethodMeta < Object
=begin
    This class handles the meta information of the meta property of
    external method Object.
=end
    attr_reader :name
    attr_reader :xml_attribute
    attr_reader :version
  
    def initialize(name, xml_attribute, version)
        @name = name
        @xml_attribute = xml_attribute
        @version = version
    end
end

