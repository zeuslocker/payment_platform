# frozen_string_literal: true

require 'rails_helper'
Rails.application.load_tasks

RSpec.describe 'import.rake' do
  before do
    Rake::Task['import'].reenable
  end

  context 'admins' do
    let(:csv_file) { "#{fixture_path}/csv/admins.csv" }

    it 'imports admins' do
      expect { Rake::Task['import'].invoke('Admin', csv_file) }.to change { Admin.count }.by(1)
      expect(Admin.find_by(email: 'admin2@gg.wp')).to be_truthy
    end
  end

  context 'merchants' do
    let(:csv_file) { "#{fixture_path}/csv/merchants.csv" }
    it 'imports merchants' do
      expect { Rake::Task['import'].invoke('Merchant', csv_file) }.to change { Merchant.count }.by(2)
      expect(Merchant.find_by(email: 'merch1@gmail.com')).to be_truthy
    end
  end
end
