# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'


# product = Product.create(description: "Product 1", price: 19.99, rating: 4.5, proposal_id: 1)

# product.save!


Proposal.create(title: 'First Proposal', description: 'This is the first proposal')
Proposal.create(title: 'Second Proposal', description: 'This is the second proposal')

def users
  if User.all.count < 10
    10.times do |i|
      user = User.new(email:"user0#{i}@gmail.com")
      user.password = "123456"
      personnal = Personnal.new(
        name: Faker::Name.name,
        birthday:Faker::Date.birthday)
       user.personnal = personnal
      p user.save!
    end
  end
end
User.destroy_all
userU = User.create!(email: 'nak@me.com',password: 'kalvin')
userU.personnal = Personnal.new(name: 'Francois',birthday:Date.new(1971,01,14))
userU.save!
users

# need to be redone...

def contacts
  User.all.each do |u|
    array = []
    30.times do
    if rand < 0.5
      contact = Contact.new
      contact.user = u
      userid = User.all.sample.id
      contact.contact_id =userid if contact.contact_id != userid
      if array.include?(userid)
        p 'no'; userid
      else
      p contact.save!
      array.push( userid)
      end
    end
  end
end
end

Contact.destroy_all
contacts


gift = GiftSpec.new
gift.save!

occasion = Occasion.new(group_name:'myevent')
occasion.gift_spec = gift
occasion.recipient = userU.contacts.sample.id
group = Group.new()
group.occasion = occasion
occasion.save!

group = Group.new()
group.occasion = occasion

5.times  do
group = Group.new()
group.occasion = occasion
group.contact_id = userU.contacts.sample.id
group.save!
p group
end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Proposal.create(title: 'First Proposal', description: 'This is the first proposal.', user: User.first)
Proposal.create(title: 'Second Proposal', description: 'This is the second proposal.', user: User.first)
Proposal.create(title: 'Third Proposal', description: 'This is the second proposal.', user: User.first)
def users

  if User.all.count < 10
    10.times do |i|
      user = User.new(email:"user0#{i}@gmail.com")
      user.password = "123456"
      personnal = Personnal.new(
        name: Faker::Name.name,
        birthday:Faker::Date.birthday)
       user.personnal = personnal
       contact = Contact.new
       contact.user = user
       contact.save!
       user.contact = contact
      p user.save!
    end
  end
end
UserContact.destroy_all
Contact.destroy_all
User.destroy_all

userM = User.create!(email: 'mena@gmail.com',password: 'aaaaaa')
userM.personnal = Personnal.new(name: 'Menahil',birthday:Date.new(1994,01,1))
userM.save!
userU = User.create!(email: 'nak@me.com',password: 'kalvin')
userU.personnal = Personnal.new(name: 'Francois',birthday:Date.new(1971,01,14))
contact = Contact.new
contact.user = userU
p contact.save!
p contact
userU.contact = Contact.new()
p userU
p userU.save!
users

def user_contacts(userU)
  5.times do
  array = []
  user_contact = UserContact.new
  user_contact.user = userU
  contact = Contact.all.sample
  if contact.user_id != userU.id || array.include?(contact.id)
    user_contact.contact = contact
    array.push(contact.id)
    user_contact.save!
  end
  end
end

user_contacts(userU)

GroupMember.destroy_all

p gift = GiftSpec.new
p gift.save!

occasion = Occasion.new(occasion_name:'ThisIsMyEvent')
occasion.user = userU
occasion.user_contact = userU.user_contacts.sample
occasion.gift_spec = gift
p occasion
p occasion.save!

userU.user_contacts.each do |c|
  group_member = GroupMember.new
  group_member.occasion = occasion
  group_member.user_contact = c
  p group_member
  p group_member.save!
end

# recipient for the occasion.
#


def user_contacts(userU)
  array = []
  30.times do |i|
    user_contact = UserContact.new
    user_contact.user = userU
    contact = Contact.all.sample
    if contact.user_id != userU.id && !array.include?(contact.id)
      if rand <= 0.5
        print i, user_contact
        user_contact.contact = contact
        array.push(contact.id)
        print array,contact.id
        user_contact.save!
      end
    end
  end
end

user_contacts(userM)
user_contacts(userU)

def occasion(userU)
gift = GiftSpec.new
gift.save!
occasion = Occasion.new(occasion_name:Faker::Esport.event)
occasion.user = userU
occasion.user_contact = userU.user_contacts.sample
occasion.gift_spec = gift
p occasion
p occasion.save!
userU.user_contacts.each do |c|
  if rand <=0.5
    group_member = GroupMember.new
    group_member.occasion = occasion
    group_member.user_contact = c
    p group_member
    p group_member.save!
  end
end
end
occasion(userM)
occasion(userU)
occasion(userU)
occasion(userU)
userM = User.create!(email: 'mena@gmail.com',password: 'aaaaaa')
userM.personnal = Personnal.new(name: 'Menahil',birthday:Date.new(1994,01,1))
userM.save!
contact = Contact.new
contact.user = userM
contact.save!


proposal = Proposal.create(title: 'First Proposal', description: 'This is the first proposal')
proposal.user = user
proposal.save!


# product = Product.create(description: "Product 1", price: 19.99, rating: 4.5, proposal_id: 1)
# product.proposal = proposal
# product.save!
