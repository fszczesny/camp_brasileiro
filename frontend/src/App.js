import React, { useState, useEffect } from 'react';

function App() {
    const [camp_brasileiro, setCampBrasileiro] = useState(false);

    useEffect(() => {
        getEstadio();
    }, []);

    function getEstadio() {
        fetch('http://localhost:3001')
            .then(response => {
                return response.text();
            })
            .then(data => {
                setCampBrasileiro(data);
            });
    }

    // function createMerchant() {
    //     let name = prompt('Enter merchant name');
    //     let email = prompt('Enter merchant email');
    //     fetch('http://localhost:3001/merchants', {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/json',
    //         },
    //         body: JSON.stringify({ name, email }),
    //     })
    //         .then(response => {
    //             return response.text();
    //         })
    //         .then(data => {
    //             alert(data);
    //             getMerchant();
    //         });
    // }

    return (
        <div>
            {camp_brasileiro ? camp_brasileiro : 'não tem estadio diponível'}
            <br />
            <button>Add merchant</button>
        </div>
    );
}
export default App;