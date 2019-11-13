document.addEventListener(
  "DOMContentLoaded", e =>{
    if (document.getElementById("token_submit")!= null){
      const KEY = gon.payjp_key;
      Payjp.setPublicKey(KEY);
      let btn =document.getElementById("token_submit");
      btn.addEventListener("click",e =>{
        e.preventDefault();
        let card = {
          number: document.getElementById("payment_card_no").value,
          cvc: document.getElementById("cvc_code").value,
          exp_month: document.getElementById("card_expire_mm").value,
          exp_year: document.getElementById("card_expire_yy").value
        };
        Payjp.createToken(card,(status, response)=>{
          if (status === 200) {
            $("#payment_card_no").removeAttr("name");
            $("#cvc_code").removeAttr("name");
            $("#card_expire_mm").removeAttr("name");
            $("#card_expire_yy").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            document.inputForm.submit();
            } else{
              alert("カード情報が正しくありません。。");
            }
          });
        });
      }
    },
  false
);