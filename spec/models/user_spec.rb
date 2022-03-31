require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Tom1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
             posts_counter: 1)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    expect(subject).to be_valid
  end

  it 'posts_counter less than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be more than or equal 0' do
    expect(subject).to be_valid
  end

  it 'last_three_posts return 3 posts' do
    subject.posts.create(title: 'Hello', text: 'This is my 1 post')
    subject.posts.create(title: 'Hello', text: 'This is my 2 post')
    subject.posts.create(title: 'Hello', text: 'This is my 3 post')
    subject.posts.create(title: 'Hello', text: 'This is my 4 post')
    expect(subject.last_three_posts.count).to eq(3)
  end
end
