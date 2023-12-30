GOOGLE_PROJECT_ID=employees
CLOUD_RUN_SERVICE=employees
ISTANCE_CONNECTION_NAME=employees-409715:us-central1:employees
DB_USER=root
DB_PASS=
DB_NAME=employees

gcloud builds submit --tag grc.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
    --project=$GOOGLE_PROJECT_ID

gcloud run deploy $CLOUD_RUN_SERVICE \
    --image grc.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
    --add-cloudsql-instances $ISTANCE_CONNECTION_NAME \
    --update-enc-vars INSTANCE_CONNECTION_NAME=$INSTANCE_CONNECTION_NAME,DB_PASS=$DB_PASS,DB_USER=$DB_USER,DB_NAME=$DB_NAME \
    --platform managed \
    --allow-unauthentificated \
    --project=$GOOGLE_PROJECT_ID