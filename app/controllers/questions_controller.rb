class QuestionsController < ApplicationController
  def question_1
    # How many movies are in the database?
    @number_of_movies = Movie.count
  end

  def question_2
    # In what year was the oldest movie on the list released?
    @year_of_oldest_movie = Movie.order("year DESC").last.year
  end

  def question_3
    # How many movies does the director of the first movie have on the list?

    @number_of_movies_directed_by_first_movie_director = Movie.where({ :director_id => Movie.first.director_id }).count
  end

  def question_4
    # What is the most number of movies any single director has on the list?

    directors = []

    Movie.all.each do |m|
      d = Movie.where({ :director_id => m.director_id }).count
      directors << d
    end

    @most_number_of_movies_by_a_single_director = directors.max

  end

  def question_5
    # What is the most recent movie on the list that the first actor appeared in?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    # @most_recent_movie_for_first_actor = ???
  end
end
