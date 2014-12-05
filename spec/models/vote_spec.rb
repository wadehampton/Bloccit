describe Vote do
  describe "validation" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @vote.new ).to eq(1 || -1)
      end
    end
  end
end
