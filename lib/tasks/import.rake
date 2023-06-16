# frozen_string_literal: true

task :import, %i[model csv_path] => [:environment] do |_t, args|
  model_list = [Admin.to_s, Merchant.to_s].freeze
  total_inserts = 0
  options = { chunk_size: 100 }

  raise 'csv_path is missing' if args[:csv_path].blank?
  raise "model should be one of #{MODEL_LIST}" unless model_list.include? args[:model]

  SmarterCSV.process(args[:csv_path], options) do |chunk|
    res = args[:model].classify.constantize.import(chunk, validate: false)
    total_inserts += res.num_inserts
  end

  p total_inserts
end
