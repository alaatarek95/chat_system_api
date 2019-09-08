require 'elasticsearch/model'

class Message < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
end
Message.__elasticsearch__.create_index!
Message.import

