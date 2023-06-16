# frozen_string_literal: true

namespace :merchants do
  task :import, [:csv_path] => [:environment] do |_t, args|
    raise 'csv_path is missing' if args[:csv_path].blank?

    options = { chunk_size: 100 }
    SmarterCSV.process(args[:csv_path], options) do |chunk|
      Merchant.import(chunk)
    end
  end
end
