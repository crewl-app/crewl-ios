//
//  Constants.swift
//  Crewl
//
//  Created by Kaan on 25.02.2023.
//

import Firebase

/* Primary button animation delay. */
let ANIMATION_DELAY = 0.15

/* Phone text field animation delay. */
let TEXTFIELD_DELAY = 0.2

/* Async func. waiting time for actions. */
let ASYNC_DELAY_HIGH = 4.0

let ASYNC_DELAY_MEDIUM = 2.0

let ASYNC_DELAY_SMALL = 0.75

/* Get users from firebase */
let COLLECTION_USERS = Firestore.firestore().collection("users")
