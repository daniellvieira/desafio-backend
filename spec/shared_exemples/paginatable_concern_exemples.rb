shared_examples "paginatable concern" do |factory_name|
  context "when records fits page size" do
    let!(:records) { create_list(factory_name, 20) }

    context "when :page" do
      it "returns default 10 records" do
        paginated_records = described_class.paginate(nil, nil)
        expect(paginated_records.count).to eq 10
      end

      it "matches first 10 records" do
        paginated_records = described_class.paginate(nil, nil)
        expected_records = described_class.all[0..9]
        expect(paginated_records).to eq expected_records
      end
    end
    context "when :page is fulfilled" do
      let(:page) { 2 }

      it "returns default 10 records" do
        paginated_records = described_class.paginate(page, nil)
        expect(paginated_records.count).to eq 10
      end

      it "returns 10 records from right page" do
        paginated_records = described_class.paginate(page, nil)
        first_record_index = 10
        last_record_index = 19
        expected_records = described_class.all[first_record_index..last_record_index]
        expect(paginated_records).to eq expected_records
      end
    end
  end

  context "when records does not fit page size" do
    let!(:records) { create_list(factory_name, 7) }
    context "when :page" do
      it "returns 7 records" do
        paginated_records = described_class.paginate(nil, nil)
        expect(paginated_records.count).to eq 7
      end

      it "matches first 7 records" do
        paginated_records = described_class.paginate(nil, nil)
        expected_records = described_class.all[0..6]
        expect(paginated_records).to eq expected_records
      end
    end

    context "when :page is fulfilled" do
      let(:page) { 2 }

      it "does not return any records" do
        paginated_records = described_class.paginate(page, nil)
        expect(paginated_records.count).to eq 0
      end

      it "returns empty result" do
        paginated_records = described_class.paginate(page, nil)
        expect(paginated_records).to_not be_present
      end
    end
  end
end