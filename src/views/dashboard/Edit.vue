<template>
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        MAIN MENU
                        <hr>
                        <ul class="list-group">
                            <router-link :to="{name: 'profil'}" class="list-group-item text-dark text-decoration-none">
                                PROFIL
                            </router-link>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        EDIT PROFIL
                        <hr>
                        <form @submit.prevent="update">
                            <div class="form-group">
                                <label for="nip" class="front-weight-bold">NIP</label>
                                <input type="text" class="form-control" v-model="user.nip" placeholder="NIP">
                                <div v-if="validation.nip" class="mt-2 alert alert-danger">
                                    {{ validation.nip[0] }}
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="name" class="front-weight-bold">Nama Lengkap</label>
                                <input type="text" class="form-control" v-model="user.name" placeholder="Nama Lengkap">
                                <div v-if="validation.name" class="mt-2 alert alert-danger">
                                    {{ validation.name[0] }}
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="jk" class="front-weight-bold">Jenis Kelamin</label>
                                <select class="form-control" v-model="user.jk">
                                    <option value="" disabled hidden>Jenis Kelamin</option>
                                    <option value="Laki-laki">Laki-laki</option>
                                    <option value="Perempuan">Perempuan</option>
                                </select>
                                <div v-if="validation.jk" class="mt-2 alert alert-danger">
                                    {{ validation.jk[0] }}
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="agama" class="front-weight-bold">Agama</label>
                                <select class="form-control" v-model="user.agama">
                                    <option value="" disabled hidden>Agama</option>
                                    <option value="Islam">Islam</option>
                                    <option value="Kristen">Kristen</option>
                                    <option value="Buddha">Buddha</option>
                                    <option value="Hindu">Hindu</option>
                                </select>
                                <div v-if="validation.agama" class="mt-2 alert alert-danger">
                                    {{ validation.agama[0] }}
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="alamat" class="front-weight-bold">Alamat</label>
                                <textarea class="form-control none-resize" rows="4" placeholder="Alamat" v-model="user.alamat"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import {reactive, ref, onMounted} from "vue";
import {useRouter, useRoute} from "vue-router";
import axios from 'axios'

    export default {

        setup() {
            const user = reactive({
            nip: '',
            name: '',
            jk: '',
            agama: '',
            alamat: '',
            })

            const validation = ref([]);
            const route = useRoute();
            const router = useRouter();

            onMounted(() => {
                axios.get(`http://novaagustina.online/UAS-TekWeb2.0_Kel03/BackendUAS3/public/api/profil/${route.params.id}`)
                .then(response => {
                    user.nip = response.data.data.nip
                    user.name = response.data.data.name
                    user.jk = response.data.data.jk
                    user.agama = response.data.data.agama
                    user.alamat = response.data.data.alamat
                }).catch(error => {
                    console.log(error.response.data)
                })
            })

            function update(){
                let nip = user.nip
                let name = user.name
                let jk = user.jk
                let agama = user.agama
                let alamat = user.alamat

                axios.put(`http://novaagustina.online/UAS-TekWeb2.0_Kel03/BackendUAS3/public/api/users/${route.params.id}`, {
                    nip: nip,
                    name: name,
                    jk: jk,
                    agama: agama,
                    alamat: alamat
                }).then(() => {
                    router.push({
                        name: 'profil'
                    })
                }).catch(error => {
                    validation.value = error.response.data
                })
            }

            return {
                user,
                validation,
                router,
                update
            }

        }

    }
</script>
<style>
.none-resize {
    resize: none;
}
</style>