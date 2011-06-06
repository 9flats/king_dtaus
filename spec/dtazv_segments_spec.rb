require 'spec/spec_helper'
# All Test DTAZV output strings are validated with sFirm => lokal Sparkassen Software
describe KingDta::DtazvSegments do

  before :each do
    @dudes_dtazv_export = KingDta::Dtazv.new(Date.today)
    @dudes_konto = dudes_konto
    @dudes_dtazv_export.account = KingDta::Account.new(
                        @dudes_konto.account_nr,
                        @dudes_konto.account_bank_number,
                        @dudes_konto.sender_name,
                        @dudes_konto.client_number,
                        @dudes_konto.account_street,
                        @dudes_konto.account_city,
                        @dudes_konto.account_zip_code,
                        @dudes_konto.account_bank_name
                        @dudes_konto.sender_street,
                        @dudes_konto.sender_city,
                        @dudes_konto.sender_zip_code,
                      )
  end

  it "should return the proper P segment" do
    @dudes_dtazv_export.add_p.should == "0256P37040044                                                     Commerzbank Köln                         5th avenue                        los angeles1106060100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  end

  it "should return the proper length of P segment" do
    @dudes_dtazv_export.add_p.size.should == 256
  end

end
