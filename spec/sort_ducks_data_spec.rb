require 'sort_ducks_data'

describe do

  it "Test for a fairly short list will be sorted" do
    expect(create_report(["Redhead 3", "Gadwall  1", "Smew 4",
      "Greater Scaup 10", "Redhead 3", "Gadwall 9", "Greater Scaup  15",
      "Common Eider 6"])).to eq ["COMEID", 6, "GADWAL", 10,
        "GRESCA", 25, "REDHEA", 6, "SMEW", 4] 
  end

  it "Tests for if 'Labrador Duck' is in the list then whole list"\
    "should be thrown out" do
    expect(create_report(["Labrador Duck 3",])).to eq ["Disqualified data"]
  end
end
