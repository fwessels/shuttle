# Copyright 2013 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

set :output, '/app/shuttle/shared/log/whenever.log'

every(30.minutes) { runner 'AutoImporter.perform_once' }

# god damn it why must it come to this
every(1.hour) { rake 'maintenance:fix_hung_commits' }
every(1.hour) { rake 'maintenance:clear_stale_lockfiles' }
