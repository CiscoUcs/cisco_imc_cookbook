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

#This Module contains the SDK general utilities

module ImcGenUtils
    AFFIRMATIVE_LIST = ['true', 'True', 'TRUE', true, 'yes', 'Yes', 'YES']

    def self.word_l(word)
        #Method makes the first letter of the given string as lower case.
        return word[0].downcase + word[1..-1]
    end
    
    def self.word_u(word)
        #Method makes the first letter of the given string as capital
        return word[0].capitalize + word[1..-1]
    end
end

