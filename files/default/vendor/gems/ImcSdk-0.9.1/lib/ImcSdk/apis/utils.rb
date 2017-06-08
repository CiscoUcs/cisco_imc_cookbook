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


require_relative "../imcexception.rb"

def _get_mo(handle:, dn: nil, **kwargs)

    if handle.nil?
        raise ImcOperationError.new("Get Managed Object for dn: #{dn}", "Handle is nil")
    end
    if dn
        mo = handle.query_dn(dn: dn)
        if mo.nil?
            raise ImcOperationError.new("Get Managed Object for dn:#{dn}", "Managed Object doesn't exist")
        end
        return mo
    end

    return nil
end


def _is_invalid_value(value)
    return ["", nil].include? value
end


def _is_valid_arg(param, kwargs)
    return !kwargs[param.to_sym].nil?
end

Tuple = Struct.new(:first, :second) do
    def <=>(other)
        return second <=> other.second if first == other.first
            first <=> other.first
    end

    def to_s
        "(#{first}, #{second})"
    end
end

class TrueClass; def to_i; 1; end; end
class FalseClass; def to_i; 0; end; end