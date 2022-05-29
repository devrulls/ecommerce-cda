import React, {useEffect} from "react";
import {LinkContainer} from "react-router-bootstrap";
import {Button, Table} from "react-bootstrap";
import {useNavigate} from "react-router-dom";
import {useDispatch, useSelector} from "react-redux";
import {Message} from "../components/Message";
import {Loader} from "../components/Loader";
import {deleteUsers, listUsers} from "../actions/userActions";


export const UserListScreen = () => {
    const navigate = useNavigate();
    const dispatch = useDispatch();

    const userList = useSelector(state => state.userList);
    const {error, loading, users} = userList;

    const userLogin = useSelector(state => state.userLogin);
    const {userInfo} = userLogin;

    const userDelete = useSelector(state => state.userDelete);
    const {success: successDelete} = userDelete;

    const deleteHandler = (id) => {
        if (window.confirm('Are you sure you want to delete this user?')) {
            dispatch(deleteUsers(id))
        }
    }

    useEffect(() => {
        if (userInfo && userInfo.isAdmin) {
            dispatch(listUsers())
        } else {
            navigate('/login')
        }
    }, [dispatch, navigate, successDelete])


    return (
        <div>
            <h1>Users</h1>
            {loading
                ? <Loader/>
                : error
                    ? <Message variant='danger'>{error}</Message>
                    : (
                        <Table striped bordered hover responsive className='table'>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>NAME</th>
                                <th>EMAIL</th>
                                <th>ADMIN</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            {users.map(user => (
                                <tr key={user._id}>
                                    <td>{user._id}</td>
                                    <td>{user.name}</td>
                                    <td>{user.email}</td>
                                    <td>{user.isAdmin ? (
                                        <i className='fa-solid fa-user-check' style={{color: "green"}}></i>
                                    ) : (
                                        <i className='fa-solid fa-user' style={{color: "red"}}></i>
                                    )}</td>
                                    <td>
                                        <LinkContainer to={`/admin/user/${user._id}/edit`}>
                                            <Button variant='light' className='btn-sm'>
                                                <i className='fa-solid fa-user-pen'></i>
                                            </Button>
                                        </LinkContainer>
                                        <Button variant='danger' className='btn-sm'
                                                onClick={() => deleteHandler(user._id)}>
                                            <i className='fa-solid fa-user-xmark'></i>
                                        </Button>
                                    </td>
                                </tr>
                            ))}
                            </tbody>
                        </Table>
                    )
            }
        </div>
    )
}