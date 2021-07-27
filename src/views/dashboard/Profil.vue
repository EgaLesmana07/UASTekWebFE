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

                        <ul class="list-group">
                            <router-link :to="{name: 'edit', params: {id: user.id}}" class="btn btn-sm btn-primary mr-1">
                                Edit Profil
                            </router-link>
                            <button @click.prevent="postDelete(user.id)"
                                        class="btn btn-sm btn-danger mr-1">Hapus</button>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        PROFIL
                        <hr>
                        <div class="form-group">
                            <label for="nip" class="front-weight-bold">NIP</label>
                            <div class="form-control">         
                                {{ user.nip }}
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name" class="front-weight-bold">Nama Lengkap</label>
                            <div class="form-control">         
                                {{ user.name }}
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="front-weight-bold">Email</label>
                            <div class="form-control">         
                                {{ user.email }}
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="jk" class="front-weight-bold">Jenis Kelamin</label>
                            <div class="form-control">         
                                {{ user.jk }}
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="agama" class="front-weight-bold">Agama</label>
                            <div class="form-control">         
                                {{ user.agama }}
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="alamat" class="front-weight-bold">Alamat</label>
                            <div class="form-control">         
                                {{ user.alamat }}
                            </div>
                        </div>
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
            function postDelete(id) {
                axios.defaults.headers.common.Authorization = `Bearer ${token}`
                axios
                .delete(`http://novaagustina.online/UAS-TekWeb2.0_Kel03/BackendUAS3/public/api/users/${id}`)
                .then((response)=>{
                    alert("Data akun anda berhasil dihapus!!!");
                    if(response.data.success == true){
                        delete posts.value[id];

                        localStorage.removeItem('token')

                        return router.push({
                            name: 'login'
                        })
                    }
                })
                .catch((error) => {
                    console.log(error.response.data);
                });
            }

            return {
                token,      // <-- state token
                user,       // <-- state user
                logout,      // <-- method logout
                posts,
                postDelete
            }

        }

    }
</script>