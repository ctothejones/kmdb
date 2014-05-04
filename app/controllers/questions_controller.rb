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

    m = Movie.where({ :director_id => Movie.first.director_id })

    @number_of_movies_directed_by_first_movie_director = m.count
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

    roles_for_actor = Role.where({ :actor_id => Actor.first.id })
    only_ids = roles_for_actor.select("movie_id")
    list_of_movies = Movie.where({ :id => only_ids })
    movies_ordered_by_year_desc = list_of_movies.order("year DESC")

    @most_recent_movie_for_first_actor = movies_ordered_by_year_desc.first.title
  end
end
