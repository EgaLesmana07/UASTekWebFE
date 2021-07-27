<template>
    <div class="container-fluid mt-5">
      <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card border-0 rounded shadow">
                    <div class="card-body">
                        <h4>REGISTER</h4>
                        <hr>
                        <form @submit.prevent="register">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>NIP</label>
                                        <input type="text" v-model="user.nip" class="form-control"
                                            placeholder="NIP">
                                    </div>
                                    <div v-if="validation.nip" class="mt-2 alert alert-danger">
                                        {{ validation.nip[0] }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Nama Lengkap</label>
                                        <input type="text" v-model="user.name" class="form-control"
                                            placeholder="Nama Lengkap">
                                    </div>
                                    <div v-if="validation.name" class="mt-2 alert alert-danger">
                                        {{ validation.name[0] }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Jenis Kelamin</label>
                                        <select class="form-control" v-model="user.jk">
                                            <option value="" disabled hidden>Jenis Kelamin</option>
                                            <option value="Laki-laki">Laki-laki</option>
                                            <option value="Perempuan">Perempuan</option>
                                        </select>
                                    </div>
                                    <div v-if="validation.jk" class="mt-2 alert alert-danger">
                                        {{ validation.jk[0] }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Agama</label>
                                        <select class="form-control" v-model="user.agama">
                                            <option value="" disabled hidden>Agama</option>
                                            <option value="Islam">Islam</option>
                                            <option value="Kristen">Kristen</option>
                                            <option value="Buddha">Buddha</option>
                                            <option value="Hindu">Hindu</option>
                                        </select>
                                    </div>
                                    <div v-if="validation.agama" class="mt-2 alert alert-danger">
                                        {{ validation.agama[0] }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Alamat</label>
                                        <textarea class="form-control none-resize" rows="4" placeholder="Alamat" v-model="user.alamat"></textarea>
                                    </div>
                                    <div v-if="validation.alamat" class="mt-2 alert alert-danger">
                                        {{ validation.alamat[0] }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email address</label>
                                        <input type="email" v-model="user.email" class="form-control"
                                            placeholder="Email Address">
                                    </div>
                                    <div v-if="validation.email" class="mt-2 alert alert-danger">
                                        {{ validation.email[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" v-model="user.password" class="form-control"
                                            placeholder="Password">
                                    </div>
                                    <div v-if="validation.password" class="mt-2 alert alert-danger">
                                        {{ validation.password[0] }}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Konfirmasi Password</label>
                                        <input type="password" v-model="user.password_confirmation" class="form-control"
                                            placeholder="Konfirmasi Password">
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">REGISTER</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

export default {
    setup() {
        //inisialisasi vue router on Composition API
        const router = useRouter()

            //state user
            const user = reactive({
                nip: '',
                name: '',
                jk: '',
                agama: '',
                alamat: '',
                email: '',
                password: '',
                password_confirmation: ''
            })

            //state validation
            const validation = ref([])

            //method register
            function register() {

                //define variable 
                let nip = user.nip
                let name = user.name
                let jk = user.jk
                let agama = user.agama
                let alamat = user.alamat
                let email = user.email
                let password = user.password
                let password_confirmation = user.password_confirmation

                //send server with axios
                axios.post('http://novaagustina.online/UAS-TekWeb2.0_Kel03/BackendUAS3/public/api/register', {
                        nip,
                        name,
                        jk,
                        agama,
                        alamat,
                        email,
                        password,
                        password_confirmation
                })
                .then(() => {

                    //redirect ke halaman login
                    return router.push({
                        name: 'login'
                    })

                }).catch(error => {
                    //set validation dari error response
                    validation.value = error.response.data
                })

            }

            return {
                user, // <-- state user
                validation, // <-- state validation 
                register // <-- method register
            }

        }

    }
</script>
<style>
    .none-resize {
        resize: none;
    }
</style>