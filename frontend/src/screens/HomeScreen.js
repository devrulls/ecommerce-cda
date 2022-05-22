import React, {useState, useEffect} from "react";
import {useDispatch, useSelector} from "react-redux";
import {Row, Col} from "react-bootstrap";
// import products from "../products";
import {Product} from "../components/Product";
import {Loader} from "../components/Loader";
import {Message} from "../components/Message";
import {listProducts} from "../actions/productsActions";
// import axios from "axios";


export const HomeScreen = () => {
    // const [products, setProducts] = useState([]);
    const dispatch = useDispatch()
    const productList = useSelector(state => state.productList)
    const {error, loading, products} = productList

    useEffect(() => {
        dispatch(listProducts())
        // async function fetchProducts() {
        //     const {data} = await axios.get('/api/products/')
        //     setProducts(data)
        // }

        // fetchProducts()
    }, []);

    return (
        <div>
            <h1>Latest Products</h1>
            {loading
                ? <Loader/>
                : error
                    ? <Message variant='danger'>{error}</Message>
                    :
                    <Row>
                        {products.map(product => {
                            return (
                                <Col key={product._id} sm={12} md={6} lg={4} xl={3}>
                                    <Product product={product}/>
                                    {/*<h3>{product.name}</h3>*/}
                                </Col>
                            )
                        })}
                    </Row>
            }

        </div>
    )
}