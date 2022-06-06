import React, {useState} from "react";
import {Button, Form} from 'react-bootstrap';
import { useNavigate, useLocation } from 'react-router-dom';

export const SearchBox = () => {
     let navigate = useNavigate();
     const location = useLocation();
     const [keyword, setKeyword] = useState('')
     let url_keyword = `/?keyword=${keyword}`;

     const submitHandler = (e) =>{
        e.preventDefault()
         console.log(location)

         if(keyword){
             console.log('Yes Hay algo ====>', keyword)
             console.log(url_keyword)
             navigate(url_keyword)

         }else{
             console.log('Ohhhh no  nada ====>', keyword)
             console.log(url_keyword)
             console.log(location.pathname)
             navigate(location.pathname)
         }
     }
    return(
        <Form onSubmit={submitHandler} className='d-inline-flex'>
            <Form.Control
            type='text'
            name='q'
            onChange={(e) => setKeyword(e.target.value)}
            className='mr-sm-2 ml-sm-5'
            >
            </Form.Control>
            <Button type='submit' variant='outline-info' className='p-2'>
                Buscar
            </Button>
        </Form>
    )

}