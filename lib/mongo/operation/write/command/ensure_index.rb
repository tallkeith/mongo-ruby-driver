# Copyright (C) 2014-2015 MongoDB, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Mongo
  module Operation
    module Write
      module Command

        # A MongoDB ensure index write command operation.
        #
        # @example Create an ensure index command operation.
        #   Write::Command::EnsureIndex.new({
        #     :index => { :foo => 1 },
        #     :db_name => 'test',
        #     :coll_name => 'test_coll',
        #     :index_name => 'foo_1'
        #     :options => { :unique => true }
        #   })
        #
        # @since 2.0.0
        class CreateIndex
          include Specifiable
          include Executable
          include Writable

          private

          # The query selector for this ensure index command operation.
          #
          # @return [ Hash ] The selector describing this insert operation.
          #
          # @since 2.0.0
          def selector
            {
              :createIndexes => coll_name,
              :indexes => [ options.merge(key: index, name: index_name) ],
            }
          end
        end
      end
    end
  end
end

