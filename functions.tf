data "archive_file" "my_function" {
  type        = "zip"
  source_file = "function_code/main.py"
  output_path = "main.zip"
}

resource "google_cloudfunctions_function" "function" {
  name                  = "ec2-shutdown-function"
  description           = "My function created with Terraform"
  available_memory_mb   = 256
  source_archive_bucket = "rj-function-code-bucket"
  source_archive_object = "main.zip"
  trigger_http          = true
  runtime               = "python39"

  entry_point = "handle_http_request"
}

resource "google_cloud_scheduler_job" "job" {
  name             = "my-job"
  region           = "us-central1"
  description      = "This job will trigger my-function every day at 8:00 PM"
  schedule         = "0 20 * * *"
  time_zone        = "America/New_York" # Adjust this to your time zone

  http_target {
    http_method = "GET"
    uri         = google_cloudfunctions_function.function.https_trigger_url
  }
}