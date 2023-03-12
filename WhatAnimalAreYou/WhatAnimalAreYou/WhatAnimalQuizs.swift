//
//  WhatAnimalQuizs.swift
//  WhatAnimalAreYou
//
//  Created by david on 2023-03-11.
//

import Foundation

struct quizs {
var list: [Quiz] = [
    Quiz(question: "Now, please imagine yourself in a forest. As you walk forward, you see a small cottage before you.",
         answers: [
            Answer(id: 1,
                   text: "is there a large tree in front of the cottage?",
                   addLikehood: [
                    personality.likeOwl(),
                    personality.likeButterfly()
                   ]
         ])
]
}
