import React from "react";
import {Routes, Route, Navigate} from "react-router-dom";
import {Error} from "../components/Error";
import {HomeScreen} from "../screens/HomeScreen";
import {ProductScreen} from "../screens/ProductScreen";
import {CartScreen} from "../screens/CartScreen";
import {LoginScreen} from "../screens/LoginScreen";



export const Routing = () => {
    return (
            <Routes>
                <Route path="/" element={<Navigate to="/home"/>}/>
                <Route path="/home" element={<HomeScreen/>}/>
                <Route path="/login" element={<LoginScreen/>}/>
                <Route path="/product/:id" element={<ProductScreen/>}/>
                <Route path="/cart/:id" element={<CartScreen/>}/>
                <Route path="/cart" element={<CartScreen/>}/>
                <Route path="*" element={<Error/>}/>
            </Routes>
    )
}