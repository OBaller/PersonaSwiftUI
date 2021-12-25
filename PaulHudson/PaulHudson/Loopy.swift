//
//  Loopy.swift
//  PaulHudson
//
//  Created by naseem on 25/12/2021.
//

import SwiftUI

struct Loopy: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {stud in
                        Text(stud)
                    }
                }
            }
        }
    }
}

struct Loopy_Previews: PreviewProvider {
    static var previews: some View {
        Loopy()
    }
}
