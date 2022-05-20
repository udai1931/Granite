import React, { useEffect, useState } from "react";

import usersApi from "apis/users";
import Container from "components/Container";
import TaskForm from "components/Tasks/Form/TaskForm";
import tasksApi from "apis/tasks";

const CreateTask = ({ history }) => {
  const [title, setTitle] = useState("");
  const [userId, setUserId] = useState("");
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);
  const [pageLoading, setPageLoading] = useState(true);

  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      let obj = { task: { title: title,assigned_user_id: userId } }
      await tasksApi.create(obj);
      setLoading(false);
      history.push("/");
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  const fetchUserDetails = async () => {
    try {
      const response = await usersApi.list();
      setUsers(response.data.users);
    } catch (error) {
      logger.error(error);
    } finally {
      setPageLoading(false);
    }
  };

  useEffect(()=>{
    fetchUserDetails();
  },[])

  return (
    <Container>
      <TaskForm
        title={title}
        users={users}
        setTitle={setTitle}
        setUserId={setUserId}
        loading={loading}
        handleSubmit={handleSubmit}
      />
    </Container>
  );
};

export default CreateTask;
