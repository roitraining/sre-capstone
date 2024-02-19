# Change the value of the variable on the 
# next line to your Google Cloud Project ID
project_id          = "project-id-here" 

# Docker Images to deploy
# Change the 3 image names to your image names
external_image_name = "coursedemos/dso-external:v1.0"
internal_image_name = "coursedemos/dso-internal:v1.0"
db-init_image_name = "coursedemos/dso-db-init:v1.0"

gcp_region_1 = "us-central1"
gcp_zone_1   = "us-central1-a"

# Application Name (used in resource names, no spaces.)
app_name = "events-app-iac"

gke-node-service-account-name = "gke-node-sa"
