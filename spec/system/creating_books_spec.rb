require 'rails_helper'

RSpec.describe 'CreatingBooks', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves book and displays flash notice on homescreen' do
    visit 'books/new'

    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: 1.20
    fill_in 'Published date', with: Date.today
    click_on 'Create New Book'

    expect(page).to have_content('Book sucessfully created')
    expect(page).to have_content('Test Book')
    expect(page).to have_content('Test Author')
    expect(page).to have_content(1.20)
    expect(page).to have_content(Date.today)

    book = Book.order('id').last
    expect(book.title).to eq('Test Book')
  end

  it 'flashes warning on blank book title' do
    visit 'books/new'

    fill_in 'Title', with: ''

    click_on 'Create New Book'

    expect(page).to have_content('Title can\'t be blank')
  end

  it 'flashes warning on blank book author' do
    visit 'books/new'

    fill_in 'Author', with: ''

    click_on 'Create New Book'

    expect(page).to have_content('Author can\'t be blank')
  end

  it 'flashes warning on blank book price' do
    visit 'books/new'

    # Just ignore the price field
    # fill_in 'Price', with:

    click_on 'Create New Book'

    expect(page).to have_content('Price can\'t be blank')
  end

  it 'flashes warning on blank book publish date' do
    visit 'books/new'

    fill_in 'Published date', with: ''

    click_on 'Create New Book'

    expect(page).to have_content('Published date can\'t be blank')
  end
end
