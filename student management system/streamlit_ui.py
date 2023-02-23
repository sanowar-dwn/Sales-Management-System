import streamlit as st
from Contract_Deployment import *

student_id = st.text_input("Enter the student id")
if st.button('Get Student'):
    student_id = int(student_id)
    st.success(getStudents(student_id))
