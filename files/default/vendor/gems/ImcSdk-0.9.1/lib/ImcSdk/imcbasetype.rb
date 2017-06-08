# Copyright 2015 Cisco Systems, Inc.
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


#This is an auto-generated module.
#It contains supporting classes for Filter and External Method.


require_relative 'imccore'


class Method1 < BaseObject
    #This is Method class.
    def initialize(**kwargs)
        super("Method", "method")
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end

class ConfigConfig < BaseObject
    #This is ConfigConfig class.
    def initialize(**kwargs)
        super("ConfigConfig", "configConfig")
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end

class ConfigMap < BaseObject
    #This is ConfigMap class.
    def initialize(**kwargs)
        super("ConfigMap", "configMap")
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end

class ConfigSet < BaseObject
    #This is ConfigSet class.
    def initialize(**kwargs)
        super("ConfigSet", "configSet")
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end

class FailedMo < BaseObject
    #This is FailedMo class.
    def initialize(**kwargs)
        super("FailedMo", "failedMo")
        @dn = nil
        @error_code = nil
        @error_descr = nil
        @name = nil
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end

class FailedMos < BaseObject
    #This is FailedMos class.
    def initialize(**kwargs)
        super("FailedMos", "failedMos")
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end

class FilterFilter < BaseObject
    #This is FilterFilter class.
    def initialize(**kwargs)
        super("FilterFilter", "filter")
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end

class Pair < BaseObject
    #This is Pair class.
    def initialize(**kwargs)
        super("Pair", "pair")
        @key = nil
        if kwargs
            kwargs.each do |n, v|
                attr_set(n, v)
            end
        end
    end
end
