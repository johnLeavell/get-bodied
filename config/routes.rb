Rails.application.routes.draw do

# user routes

get("/users/:path_id", :controller => "users", :action => "index") 

  # Routes for the Ai message resource:
  get("/", { controller: "welcome", action: "index" })
  # CREATE
  post("/insert_ai_message", { :controller => "ai_messages", :action => "create" })
          
  # READ
  get("/ai_messages", { :controller => "ai_messages", :action => "index" })
  
  get("/ai_messages/:path_id", { :controller => "ai_messages", :action => "show" })
  
  # UPDATE
  
  post("/modify_ai_message/:path_id", { :controller => "ai_messages", :action => "update" })
  
  # DELETE
  get("/delete_ai_message/:path_id", { :controller => "ai_messages", :action => "destroy" })

  #------------------------------

  # Routes for the Workout exercise resource:

  # CREATE
  post("/insert_workout_exercise", { :controller => "workout_exercises", :action => "create" })
          
  # READ
  get("/workout_exercises", { :controller => "workout_exercises", :action => "index" })
  
  get("/workout_exercises/:path_id", { :controller => "workout_exercises", :action => "show" })
  
  # UPDATE
  
  post("/modify_workout_exercise/:path_id", { :controller => "workout_exercises", :action => "update" })
  
  # DELETE
  get("/delete_workout_exercise/:path_id", { :controller => "workout_exercises", :action => "destroy" })

  #------------------------------

  # Routes for the Exercise resource:

  # CREATE
  post("/insert_exercise", { :controller => "exercises", :action => "create" })
          
  # READ
  get("/exercises", { :controller => "exercises", :action => "index" })
  
  get("/exercises/:path_id", { :controller => "exercises", :action => "show" })
  
  # UPDATE
  
  post("/modify_exercise/:path_id", { :controller => "exercises", :action => "update" })
  
  # DELETE
  get("/delete_exercise/:path_id", { :controller => "exercises", :action => "destroy" })

  #------------------------------

  # Routes for the User workout resource:

  # CREATE
  post("/insert_user_workout", { :controller => "user_workouts", :action => "create" })
          
  # READ
  get("/user_workouts", { :controller => "user_workouts", :action => "index" })
  
  get("/user_workouts/:path_id", { :controller => "user_workouts", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_workout/:path_id", { :controller => "user_workouts", :action => "update" })
  
  # DELETE
  get("/delete_user_workout/:path_id", { :controller => "user_workouts", :action => "destroy" })

  #------------------------------

  # Routes for the Workout resource:

  # CREATE
  post("/insert_workout", { :controller => "workouts", :action => "create" })
          
  # READ
  get("/workouts", { :controller => "workouts", :action => "index" })
  
  get("/workouts/:path_id", { :controller => "workouts", :action => "show" })
  
  # UPDATE
  
  post("/modify_workout/:path_id", { :controller => "workouts", :action => "update" })
  
  # DELETE
  get("/delete_workout/:path_id", { :controller => "workouts", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
