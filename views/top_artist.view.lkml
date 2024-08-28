view: top_artist {
  derived_table: {
    sql:
      WITH top_artist AS (
        SELECT
          track_id,
          track_popularity as popularity,
          track_artist as artist,
          track_name as top_music,
          track_album_name as album_name

        FROM top_songs_spotify
        WHERE
          {% condition analytic_songs.select_year %}
            CAST(EXTRACT(ISOYEAR FROM track_album_release_date) AS STRING)
          {% endcondition %}
        GROUP BY
          1,2,3,4,5
        ORDER BY track_popularity DESC
        LIMIT 10
      )

      SELECT * FROM top_artist ;;
  }

  dimension: track_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: popularity {
    hidden: yes
    type: number
    sql: ${TABLE}.popularity ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: top_music {
    type: string
    sql: ${TABLE}.top_music ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value | append: ' - ' | append: top_artist.artist._value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: album_name {
    type: string
    sql: ${TABLE}.album_name ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value | append: ' - ' | append: top_artist.artist._value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  measure: avg_popularity_by_top_artist {
    type: average
    sql: ${popularity} ;;
  }
}
