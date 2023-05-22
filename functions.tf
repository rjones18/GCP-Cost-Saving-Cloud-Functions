resource "google_cloudfunctions_function" "function" {
  name                  = "stop-instance-function"
  description           = "A function to stop a Compute Engine instance"
  available_memory_mb   = 256
  source_archive_bucket = "rj-function-code-bucket"
  source_archive_object = "function1.zip"
  trigger_http          = true
  runtime               = "python310"

  entry_point = "stop_instance"

  environment_variables = {
    GCP_PROJECT = "alert-flames-286515"
  }
}

resource "google_cloud_scheduler_job" "job" {
  name             = "my-job"
  region           = "us-central1"
  description      = "This job will trigger my-function every day at 8:00 PM"
  schedule         = "0 20 * * *"
  time_zone        = "America/Chicago" # Adjust this to your time zone

  http_target {
    http_method = "GET"
    uri         = google_cloudfunctions_function.function.https_trigger_url
  }
}