class SavingRecordJob < ApplicationJob
  queue_as :default

  def perform

    # Open JSON File
    file = File.read('temp.json')


    # Parse Data from File
    data_hash = JSON.parse(file)
        counter = 0
    
    data_hash["jobs"].each do|object|
      counter = counter + 1
      if object["job_#{counter}"]
        if object["job_#{counter}"]["job_type"] == "message"
          save_message(object["job_#{counter}"]["job_args"])
          
        elsif object["job_#{counter}"]["job_type"] == "chat"
          save_chat(object["job_#{counter}"]["job_args"])
        end        
        save_job(object["job_#{counter}"])               
        counter >1 ?  data_hash["jobs"].pop(counter-1): data_hash["jobs"].pop
        
        
        File.open("temp.json", "w+") do |f|
          
          
          f.write(data_hash.to_json)
        end
      end
    end
    
  end
  def save_message(message_attributes)    
    message = Message.new(message_attributes)
    message.save
  end

  def save_chat(chat_attributes)    
    chat = Chat.new(chat_attributes)
    chat.save
  end

  def save_job(job_attribute)    
    job = Job.new(job_attribute)
    job.save
  end
end
