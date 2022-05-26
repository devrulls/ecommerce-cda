import React, {useState, useEffect} from "react";
import {Link, useNavigate, useParams, useLocation} from "react-router-dom";
import {Row, Col, Form, Button} from "react-bootstrap";
import {useDispatch, useSelector} from "react-redux";
// import {Product} from "../components/Product";
// import {Loader} from "../components/Loader";
// import {Message} from "../components/Message";
import {login} from "../actions/userActions"
import {FormContainer} from "../components/FormContainer";


export const LoginScreen = () => {

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();
    const dispatch = useDispatch();

    const locations = useLocation();
    const redirect = locations.pathname;
    console.log(redirect);

    const userLogin = useSelector(state => state.userLogin);
    const {error, loading, userInfo} =  userLogin;

    useEffect(()=>{
        if(userInfo){
            navigate(redirect);
        }
    },[userInfo, redirect])

    const submitHandler = (e) => {
        e.preventDefault();
        dispatch(login(email,password))
        console.log("submitted")
    }

    // const dispatch = useDispatch()
    // const productList = useSelector(state => state.productList)
    // const {error, loading, products} = productList

    return (
        <FormContainer>
            <h1>Login Screen</h1>
            <Form onSubmit={submitHandler}>
                <Form.Group controlId="email">
                    <Form.Label>Email Address</Form.Label>
                    <Form.Control
                        type='email'
                        placeholder='Enter Email'
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                    >
                    </Form.Control>
                </Form.Group>

                <Form.Group controlId="password">
                    <Form.Label>password</Form.Label>
                    <Form.Control
                        type='password'
                        placeholder='Enter Password'
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                    >
                    </Form.Control>
                </Form.Group>

                <Button
                type='submit' variant='primary'
                >Sign In
                </Button>
            </Form>

            <Row className='py-3'>
                <Col>New Customer? <Link to={redirect ? `/register?redirect=${redirect}` : '/register'}>Register</Link></Col>
            </Row>
        </FormContainer>
    )
}
