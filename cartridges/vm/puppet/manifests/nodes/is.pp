# ----------------------------------------------------------------------------
#  Copyright 2005-2015 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------

# IS cartridge node
node /is/ inherits base {

  class { 'java': }
  class { 'python_agent':
    docroot => "/var/www/"
  }
  class { 'configurator': }
  class { 'is':
    server_name      => 'wso2is',
    version          => '5.0.0'

  }

  Class['stratos_base'] -> Class['java'] -> Class['configurator']-> Class['python_agent'] -> Class['is']
}


