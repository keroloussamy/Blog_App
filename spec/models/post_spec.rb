# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   subject do
#     Post.create(
#       author: User.create(
#         name: 'Tom1',
#         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#         bio: 'Teacher from Mexico.',
#         posts_counter: 1
#       ),
#       title: 'Hello',
#       text: 'This is my first post',
#       comments_counter: 1,
#       likes_counter: 1
#     )
#   end

#   it 'title should be present' do
#     subject.title = nil
#     expect(subject).to_not be_valid
#   end

#   it 'title should be present' do
#     expect(subject).to be_valid
#   end

#   it 'text should be less than 250 character' do
#     subject.title = nil
#     expect(subject).to_not be_valid
#   end

#   it 'text should be present' do
#     expect(subject).to be_valid
#   end

#   it 'comments_counter less than 0' do
#     subject.comments_counter = -1
#     expect(subject).to_not be_valid
#   end

#   it 'comments_counter should be more than or equal 0' do
#     expect(subject).to be_valid
#   end

#   it 'likes_counter less than 0' do
#     subject.likes_counter = -1
#     expect(subject).to_not be_valid
#   end

#   it 'likes_counter should be more than or equal 0' do
#     expect(subject).to be_valid
#   end

#   it 'update_post_user_counter should update post user counter' do
#     expect(subject.author.posts_counter).to eq(2)
#   end

#   it 'last_five_comments return 5 comments' do
#     subject.comments.create(text: 'Hi Tom!')
#     subject.comments.create(text: 'Hi Tom!')
#     subject.comments.create(text: 'Hi Tom!')
#     subject.comments.create(text: 'Hi Tom!')
#     subject.comments.create(text: 'Hi Tom!')
#     expect(subject.last_five_comments.count).to eq(5)
#   end
# end
