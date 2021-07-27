<template>
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        MAIN MENU
                        <hr>
                        <ul class="list-group">
                            <router-link :to="{name: 'dashboard'}" class="list-group-item text-dark text-decoration-none">
                                DASHBOARD
                            </router-link>
                            <router-link :to="{name: 'jadwal'}" class="list-group-item text-dark text-decoration-none">
                                JADWAL
                            </router-link>
                            <router-link :to="{name: 'profil'}" class="list-group-item text-dark text-decoration-none">
                                PROFIL
                            </router-link>
                            <li @click.prevent="logout" class="list-group-item text-dark text-decoration-none"
                                style="cursor:pointer">LOGOUT</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        DATA JADWAL
                        <hr>
                        <table class="table table-striped table-bordered mt-4">
                            <thead class="thead-dark">
                                <tr>
                                <th scoppe="col">Kode Jadwal</th>
                                <th scoppe="col">Nama Matkul</th>
                                <th scoppe="col">SKS</th>
                                <th scoppe="col">Jam</th>
                                <th scoppe="col">Nama Dosen</th>
                                <th scoppe="col">Hari</th>
                                <th scoppe="col">Jam Awal</th>
                                <th scoppe="col">Jam Akhir</th>
                                <th scoppe="col">Ruangan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(post, index) in posts" :key="index">
                                    <td>{{ post.kd_jadwal }}</td>
                                    <td>{{ post.nm_matkul }}</td>
                                    <td>{{ post.sks }}</td>
                                    <td>{{ post.jam }}</td>
                                    <td>{{ post.name }}</td>
                                    <td>{{ post.hari }}</td>
                                    <td>{{ post.jam_awal }}</td>
                                    <td>{{ post.jam_akhir }}</td>
                                    <td>{{ post.ruangan }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

    export default {

        setup() {

            //state token
            const token = localStorage.getItem('token')

            //inisialisasi vue router on Composition API
            const router = useRouter()

            //state user
            const user = ref('')
            
            //mounted properti
            onMounted(() =>{

                //check Token exist
                if(!token) {
                    return router.push({
                        name: 'login'
                    })
                }
                
                //get data user
                axios.defaults.headers.common.Authorization = `Bearer ${token}`
                axios.get('http://novaagustina.online/UAS-TekWeb2.0_Kel03/BackendUAS3/public/api/user')
                .then(response => {

                    //console.log(response.data.name)
                    user.value = response.data

                })
                .catch(error => {
                    console.log(error.response.data)
                })

            })

            //method logout
            function logout() {

                //logout
                axios.defaults.headers.common.Authorization = `Bearer ${token}`
                axios.post('http://novaagustina.online/UAS-TekWeb2.0_Kel03/BackendUAS3/public/api/logout')
                .then(response => {

                    if(response.data.success) {

                        //remove localStorage
                        localStorage.removeItem('token')

                        //redirect ke halaman login
                        return router.push({
                            name: 'login'
                        })

                    }

                })
                .catch(error => {
                    console.log(error.response.data)
                })

            }

            let posts = ref([])
            onMounted(() => {
                axios.get('http://novaagustina.online/UAS-TekWeb2.0_Kel03/BackendUAS3/public/api/jadwal')
                .then(respon => {
                    const res = respon.data;
                    const tmp  = {};

                    if (res.success == true){
                        const data = res.data;
                        data.forEach((item) => {
                            tmp [item.id]=item;
                        });
                    }
                    console.log(tmp)
                    posts.value = tmp;

                }).catch((error) => {
                    console.log(error.response.data);
                });
            });

            return {
                token,      // <-- state token
                user,       // <-- state user
                logout,      // <-- method logout
                posts,
            }

        }

    }
</script>

<style>
body{
    background: lightgray;
}
</style>