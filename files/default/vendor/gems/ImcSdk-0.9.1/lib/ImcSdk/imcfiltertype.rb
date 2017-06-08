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
#It contains supporting classes for Filter.


require_relative 'imccore'


class AllbitsFilter < AbstractFilter
    #This is AllbitsFilter class.
    def initialize()
        super("AllbitsFilter", "allbits")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class AndFilter < AbstractFilter
    #This is AndFilter class.
    def initialize()
        super("AndFilter", "and")

    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        
    end
end

class AnybitFilter < AbstractFilter
    #This is AnybitFilter class.
    def initialize()
        super("AnybitFilter", "anybit")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class BwFilter < AbstractFilter
    #This is BwFilter class.
    def initialize()
        super("BwFilter", "bw")

        @class_ = nil
        @first_value = nil
        @property = nil
        @second_value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @first_value = kwargs['first_value']
        @property = kwargs['property']
        @second_value = kwargs['second_value']
    end
end

class EqFilter < AbstractFilter
    #This is EqFilter class.
    def initialize()
        super("EqFilter", "eq")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class GeFilter < AbstractFilter
    #This is GeFilter class.
    def initialize()
        super("GeFilter", "ge")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class GtFilter < AbstractFilter
    #This is GtFilter class.
    def initialize()
        super("GtFilter", "gt")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class LeFilter < AbstractFilter
    #This is LeFilter class.
    def initialize()
        super("LeFilter", "le")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class LtFilter < AbstractFilter
    #This is LtFilter class.
    def initialize()
        super("LtFilter", "lt")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class NeFilter < AbstractFilter
    #This is NeFilter class.
    def initialize()
        super("NeFilter", "ne")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end

class NotFilter < AbstractFilter
    #This is NotFilter class.
    def initialize()
        super("NotFilter", "not")

    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        
    end
end

class OrFilter < AbstractFilter
    #This is OrFilter class.
    def initialize()
        super("OrFilter", "or")

    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        
    end
end

class WcardFilter < AbstractFilter
    #This is WcardFilter class.
    def initialize()
        super("WcardFilter", "wcard")

        @class_ = nil
        @property = nil
        @value = nil
    end
    def create(**kwargs)
        #This method populate the attribute of filter object.
        @class_ = kwargs['class_']
        @property = kwargs['property']
        @value = kwargs['value']
    end
end
