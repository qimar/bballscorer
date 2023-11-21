String getAllLessonsByDrill =
    '''query getAllLessonByDrill(\$whereLessonFilter: lesson_bool_exp!) {
  lesson_aggregate(where: \$whereLessonFilter) {
    aggregate {
      count
    }
  }
  lesson(where: \$whereLessonFilter) {
    id
    title
    thumbnail
    ispublished
    difficulty
    duration
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
