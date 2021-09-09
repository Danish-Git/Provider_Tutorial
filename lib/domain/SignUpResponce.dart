class SignUpResponseSuccess {
/*
{
  "name": "Danish",
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWQ2ZmUzNzI0OGFmZjgzZDY5YjQ0NGU1ZDE0NDEzNDdkODEyYWMyYzk0ZjU3YTI0NmU5MjM3NWE0NzgwZmUzOWY3MzA1NGNlZDQ5MTcwNGYiLCJpYXQiOjE2MjU2Mzk2MTYsIm5iZiI6MTYyNTYzOTYxNiwiZXhwIjoxNjU3MTc1NjE2LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.NcCO_pHUuQn_sPr__xBRT-njSRYRwcZSM79eDiiI2GSgkACHwxbf61nF_g_dCZnqPgSzoyDEJhDHFO9jndGnkiroQFVHDyBY_0cv1DwaTGolc1iAPAQeJLet0_MgUMZ4D5eAuYTAT7zpFtB3dx7iZbS_wqWVTru4iC0o65pajWtbUzHAUu0d78gNlDC5XuSMShy2Xu6DiRYFhfBn-TCdsOZiGYZPZOn7XTM0qPQ8hV04l9MMudI3hJkf6ykz4Odbg77FD0mINYrF434o5zMZewz68Jl0uEWW710yK9MG-4tZg_5osZNvrHiUHpiATSTMkd476IAobqiIJyRFVe_DT0Oysxg2s6JRK0KdRQTZsWuLREM5dcnWZl1xKJD7-5UJxq3xaHa3uRxbCYi7826Qv8orUBxdFwEBjmBqCsLKUAsswj_efiBAFmUuuYYcR88AYB6_lqD-kKoVjMP-OtgAgPb0w0XfEQtEuIHBqZOwJ30ODKHzKN4W22dbRo0LM_7VrwLYdCulVflB44JXL8hwYWq3wEVRYRqlCcQNKrnUikDBvoF0P9XymhI4AIJ-SN_B2Z8A2spmb0Yt24eF5_m4WW8iwJenaFfGuIV2Kdb39FzTmydu07_OjaCM-SgYv7s1RWTMZAA9WsaLO6IzkS7ZGvBTFKU5MpjqzfseELC3UDE",
  "email": "da@da.da"
}
*/

  String? name;
  String? token;
  String? email;

  SignUpResponseSuccess({
    this.name,
    this.token,
    this.email,
  });
  SignUpResponseSuccess.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    token = json["token"]?.toString();
    email = json["email"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["token"] = token;
    data["email"] = email;
    return data;
  }
}

class SignUpResponse {
/*
{
  "success": {
    "name": "Danish",
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWQ2ZmUzNzI0OGFmZjgzZDY5YjQ0NGU1ZDE0NDEzNDdkODEyYWMyYzk0ZjU3YTI0NmU5MjM3NWE0NzgwZmUzOWY3MzA1NGNlZDQ5MTcwNGYiLCJpYXQiOjE2MjU2Mzk2MTYsIm5iZiI6MTYyNTYzOTYxNiwiZXhwIjoxNjU3MTc1NjE2LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.NcCO_pHUuQn_sPr__xBRT-njSRYRwcZSM79eDiiI2GSgkACHwxbf61nF_g_dCZnqPgSzoyDEJhDHFO9jndGnkiroQFVHDyBY_0cv1DwaTGolc1iAPAQeJLet0_MgUMZ4D5eAuYTAT7zpFtB3dx7iZbS_wqWVTru4iC0o65pajWtbUzHAUu0d78gNlDC5XuSMShy2Xu6DiRYFhfBn-TCdsOZiGYZPZOn7XTM0qPQ8hV04l9MMudI3hJkf6ykz4Odbg77FD0mINYrF434o5zMZewz68Jl0uEWW710yK9MG-4tZg_5osZNvrHiUHpiATSTMkd476IAobqiIJyRFVe_DT0Oysxg2s6JRK0KdRQTZsWuLREM5dcnWZl1xKJD7-5UJxq3xaHa3uRxbCYi7826Qv8orUBxdFwEBjmBqCsLKUAsswj_efiBAFmUuuYYcR88AYB6_lqD-kKoVjMP-OtgAgPb0w0XfEQtEuIHBqZOwJ30ODKHzKN4W22dbRo0LM_7VrwLYdCulVflB44JXL8hwYWq3wEVRYRqlCcQNKrnUikDBvoF0P9XymhI4AIJ-SN_B2Z8A2spmb0Yt24eF5_m4WW8iwJenaFfGuIV2Kdb39FzTmydu07_OjaCM-SgYv7s1RWTMZAA9WsaLO6IzkS7ZGvBTFKU5MpjqzfseELC3UDE",
    "email": "da@da.da"
  }
}
*/

  SignUpResponseSuccess? success;

  SignUpResponse({
    this.success,
  });
  SignUpResponse.fromJson(Map<String, dynamic> json) {
    success = (json["success"] != null) ? SignUpResponseSuccess.fromJson(json["success"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (success != null) {
      data["success"] = success!.toJson();
    }
    return data;
  }
}