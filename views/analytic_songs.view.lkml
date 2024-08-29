include: "extends.view"
view: analytic_songs {
  extends: [extends]
  derived_table: {
    sql: WITH data_spotify AS (
        SELECT
          track_id,
          track_artist as artist,
          track_popularity as popularity,
          track_album_release_date as release_date,
          playlist_name,
          track_name,
          playlist_genre,
          danceability,
          energy,
          loudness,
          instrumentalness,
          liveness,
          valence,
          acousticness
        FROM top_songs_spotify
        WHERE
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM track_album_release_date) AS STRING)
          {% endcondition %}
      ), cte_year_select AS (
        SELECT AVG(track_popularity) as popularity_year_select, count(*) as track_released_selected_year
        FROM top_songs_spotify
        WHERE
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM track_album_release_date) AS STRING)
          {% endcondition %}
      ), cte_year_previous AS (
        SELECT AVG(track_popularity) as popularity_year_previous, count(*) as track_released_year_previous
        FROM top_songs_spotify
         WHERE
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM track_album_release_date) + 1 AS STRING)
          {% endcondition %}
      )

      SELECT * FROM data_spotify, cte_year_select, cte_year_previous ;;
  }

  measure: track_released_selected_year {
    type: number
    sql: ${TABLE}.track_released_selected_year ;;
  }
  measure: track_released_year_previous {
    type: number
    sql: ${TABLE}.track_released_year_previous ;;
  }

  dimension_group: release_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.release_date ;;
  }

  dimension: playlist_name {
    type: string
    sql: ${TABLE}.playlist_name ;;
  }

  dimension: playlist_genre {
    type: string
    sql: ${TABLE}.playlist_genre ;;
  }

  dimension: danceability {
    type: number
    sql: ${TABLE}.danceability ;;
  }

  dimension: energy {
    type: number
    sql: ${TABLE}.energy ;;
  }

  dimension: loudness {
    type: number
    sql: ${TABLE}.loudness ;;
  }

  dimension: instrumentalness {
    type: number
    sql: ${TABLE}.instrumentalness ;;
  }

  dimension: liveness {
    type: number
    sql: ${TABLE}.liveness ;;
  }

  dimension: valence {
    type: number
    sql: ${TABLE}.valence ;;
  }

  dimension: acousticness {
    type: number
    sql: ${TABLE}.acousticness ;;
  }

  dimension: danceability_classification {
    type: string
    sql:
      CASE
        WHEN ${danceability} < 0.4 THEN "Low"
        WHEN ${danceability} >= 0.4 AND ${danceability} < 0.7 THEN "Moderately"
        ELSE "Highly"
      END
    ;;
  }

  measure: average_popularity {
    type: average
    sql: ${popularity} ;;
    value_format: "#.###"
    drill_fields: [count]
  }
  measure: average_energy{
    type: average
    sql: ${energy} ;;
    value_format: "#.###"
  }
  measure: average_danceability {
    type: average
    sql: ${danceability} ;;
    value_format: "#.###"
  }
  measure: average_acousticness {
    type: average
    sql: ${acousticness} ;;
    value_format: "#.###"
  }
  measure: average_valence {
    type: average
    sql: ${valence} ;;
    value_format: "#.###"
  }
  measure: average_liveness {
    type: average
    sql: ${liveness} ;;
    value_format: "#.###"
    drill_fields: [artist, track_name, playlist_genre]
  }
  measure: average_instrumentalness {
    type: average
    sql: ${instrumentalness} ;;
    value_format: "#.###"
  }

  measure: live_recordings {
    type: count_distinct
    sql: ${track_name} ;;
    filters: [liveness: ">=0.8"]
    drill_fields: [artist, track_name, playlist_genre]
  }

  measure: songs_instrumentalness {
    type: count_distinct
    sql: ${track_name} ;;
    filters: [instrumentalness: ">=0.8"]
    drill_fields: [artist, track_name, playlist_genre]
  }

  measure: songs_acousticness {
    type: count_distinct
    sql: ${track_name} ;;
    filters: [acousticness: ">=0.8"]
    drill_fields: [track_name, artist]
  }

  measure: popularity_year_select {
    type: number
    sql: ${TABLE}.popularity_year_select ;;
    value_format: "#.##"
  }

  measure: popularity_year_previous {
    type: number
    sql: ${TABLE}.popularity_year_previous ;;
    value_format: "#.##"
  }

  measure: corr_loudness_energy {
    type: number
    sql: corr(${loudness}, ${energy}) ;;
    value_format: "#.##"
    drill_fields: [loudness, energy]

  }

  measure: corr_valence_danceability {
    type: number
    sql: corr(${valence}, ${danceability}) ;;
    value_format: "#.##"
    drill_fields: [valence, danceability]

  }

  measure: count {
    type: count
  }

  dimension: year {
    type: string
    sql: CAST(${release_date_year} AS STRING) ;;
  }

  filter: select_year {
    type: string
    suggest_explore: analytic_songs
    suggest_dimension: analytic_songs.year
    default_value: "2020"
    full_suggestions: yes
  }
}
