import streamlit as st
from Contract_Deployment import *
if st.button('Get Student'):
    st.success(getStudents())
