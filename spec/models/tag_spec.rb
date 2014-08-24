require 'rails_helper'

RSpec.describe Tag, :type => :model do
  before :each do
    john = User.create(first_name: "John", last_name: "Doe", email: "jdoe@gmail.com")
    user_id = john.id
    @post = Post.create(title: "John", content: "Doe", user_id: user_id)
    @tag = Tag.create(name: "Test")
  end

  it "should create a tag with a name" do
    expect(@tag.name).to eql("Test")
  end

  it "should allow a tag to be appended to a post" do
    @post.tags << @tag
    expect(@post.tags.size).to eql(1)
  end

  it "should require a name for a new tag" do
    tag = Tag.new(name: nil)
    tag.should_not be_valid
  end

  it "should allow a post to be appended to a tag" do
    @tag.posts << @post
    expect(@tag.posts.size).to eql(1)
  end

end
