# lib/tasks/encryptmessages.rake
namespace :encryptmessages do
  task encrypt_old_data: :environment do
    warn 'Encrypting Messages fields in batches of 1000'
    Message.find_in_batches.each_with_index do |batch, i|
      warn "Batch #{i}"
      batch.each(&:encrypt) # Uses the encrypt method provided by Rails
    end
    warn 'Done'
  end

  task decrypt: :environment do |_t, _args|
    warn 'Decrypting Messages fields in batches of 1000'
    Message.find_in_batches.each_with_index do |batch, i|
      warn "Batch #{i}"
      batch.each(&:decrypt)
    end
    warn 'Done'
  end
end
