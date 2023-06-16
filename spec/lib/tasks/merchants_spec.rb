# frozen_string_literal: true

require 'rails_helper'
Rails.application.load_tasks

RSpec.describe 'merchants.rake' do
  let(:csv_file) { "#{fixture_path}/csv/merchants.csv" }
  it 'imports merchants' do
    expect { Rake::Task['merchants:import'].invoke(csv_file) }.to increase { Merchant.count }.by(2)
  end
end
