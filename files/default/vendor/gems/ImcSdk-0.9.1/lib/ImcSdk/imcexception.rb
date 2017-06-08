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

#This module contains the SDK defined exceptions

def ImcWarning(warn_str)
    #Method to throw warnings.
end



class ImcWrapperException < Exception  
    #Parent class for all imcwrapper exceptions.
end

class ImcLogingError < ImcWrapperException
    #Login Failure error_code
    def initialize(message, error_code=nil)
        super(message)
    end
end

class Error < RuntimeError

end
class ValueError < Error
    #value error
    def initialize(message, error_code=nil)
        super(message)
    end
end
class ImcConnectionError < ImcWrapperException
    # Cannot connect to Imc Manager
    def initialize(message)
        super(message)
    end
end

class ImcOperationError < ImcWrapperException
    # Configuration Error.
    def initialize(operation, error)
        message = "#{operation} failed, error: #{error}"
        super(message)
    end
end

class ImcError < Exception
    # Base class for exceptions in imc module
end

class ImcException < ImcError
    #Class to catch exception thrown from imc.
    attr_reader :error_code
    attr_reader :error_descr
    def initialize(error_code, error_descr)
        @error_code = error_code
        @error_descr = error_descr
    end
    def to_s()
        return "[Error Code]: #{self.error_code} [Error Description]: #{self.error_descr}"
    end
end


class ImcValidationException < ImcError

    attr_reader :error_msg

    def initialize(error_msg)
        @error_msg = error_msg
    end

    def to_s()
        return "[Error Message]: #{self.error_msg}"
    end
end
