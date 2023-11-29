String getAllGamesByParamsQuery = '''


query getAllGames(\$whereGameFilter: game_bool_exp!, \$limit: Int!, \$offset: Int!) {
  game_aggregate(where: \$whereGameFilter){
    aggregate{
      count
    }
  }
  game(where: \$whereGameFilter order_by: {id: asc} limit: \$limit offset: \$offset) {
    id
    title
    thumbnail
    ispublished
    difficulty
    duration
    price
    program_type_id
    program_type {
      title
      value
      id
      price
    }
  }
}


''';
