FactoryBot.define do
  factory :movie do
    title_movie { "MyString" }
    movie_overview { "MyText" }
    vote_count { 1 }
    poster_path { "MyString" }
    release_date { "2020-05-17" }
  end
end
