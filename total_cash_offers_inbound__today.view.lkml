view: total_cash_offers_inbound__today {
  derived_table: {
    sql: SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
      SELECT  ap.AppraisalId,
          ISNULL(ap.AccountId, ap.UserId) as CustomerId,
          ap.AppraisalId as AppraisalIdStr,
          ap.CustomerSubmittedDate as CustomerSubmittedDate,
          CASE WHEN ap.AccountId IS NULL THEN ISNULL(c.FirstName +' ', '')+ ISNULL(c.MiddleName +' ', '')+ c.LastName ELSE Acc.AccountName END as CustomerName,
        CASE WHEN ap.AccountId IS NULL THEN c.City ELSE Acc.City END as City,
        CASE WHEN ap.AccountId IS NULL THEN c.State ELSE Acc.State END as State,
        CASE WHEN ap.AccountId IS NULL THEN c.Zip ELSE Acc.Zip END as Zip,
      CASE WHEN ap.AccountId IS NULL Then c.Email Else Acc.Email END as Email,
          ap.Vin,
          cast(ap.ItemYear as varchar) as Year , upper(ap.Make) as Make , ap.Model ,
          ap.CreatedDate,
          case
              when apofer.offerPrice is not null then apofer.offerPrice
              when apofer.offerPrice is null and ap.AppraisalStatusId = 4 then ap.AppraisedAmount
          end as offerPrice,
      aov.ReserveEstimatedMargin,
          (SELECT Max(v)
          FROM (VALUES (CustomerSubmittedDate), (AppraisedDate), (SupervisorAppraisedDate), (apofer.OfferAcceptedDate)) AS value(v)) as UpdatedDate,
          ISNULL(u1.FirstName +' ', '')+ ISNULL(u1.MiddleName +' ', '')+ u1.LastName    as AppraisedBy,
          ISNULL(u1.FirstName +'_', '')+ ISNULL(u1.MiddleName +'_', '')+ u1.LastName  as AppraisedById,
          ISNULL(u2.FirstName +' ', '')+ ISNULL(u2.MiddleName +' ', '')+ u2.LastName    as SubmittedBy,
          ISNULL(u2.FirstName +'_', '')+ ISNULL(u2.MiddleName +'_', '')+ u2.LastName  as SubmittedById,
          CASE WHEN ap.AccountId is null  THEN 1 ELSE 0 END as 'IsConsumer',
          CASE WHEN ap.AccountId is null  THEN 0 ELSE 1 END as 'IsDealer',
          CASE
              WHEN ap.DeadDealDate IS NOT NULL THEN 9 -- Not Purchased
              WHEN ap.PaymentDate IS NOT NULL THEN 8 -- Purchased
              WHEN ap.TerminatedDate IS NOT NULL THEN 7 -- terminated
              WHEN ap.AppraisalStatusId  =9 THEN 6 -- Expired
              WHEN ap.AppraisalStatusId  =8 THEN 5  -- Accepted
              WHEN ap.AppraisalStatusId  IN (6,7) THEN 4 -- Submitted
              --WHEN ap.AppraisalStatusId = 4 THEN 3  --- Pending Approval.  Merged into New
              --WHEN ap.AppraisalStatusId  IN (3,5) THEN 2 -- In Progress.  Merged into New
              WHEN ap.AppraisalStatusId IN(2,3,4,5)  THEN 1  -- New
          END AS 'OfferStatus',
          ap.DeadDealDate,
          ap.TerminatedDate,
          ap.PaymentDate,
        apofer.OfferReleasedDate,
        apofer.OfferAcceptedDate,
          apofer.OfferStatusId,
          ap.SupervisorAppraisedDate
      FROM AprAppraisal ap  WITH (NOLOCK)
          LEFT JOIN AprAppraisalOffer apofer WITH (NOLOCK) ON ap.AppraisalId = apofer.AppraisalId and apofer.IsActive = 1
          LEFT JOIN dbo.AprAppraisalOfferValues aov ON aov.AppraisalId = ap.AppraisalId
          LEFT JOIN OrgUser c WITH (NOLOCK) ON ap.UserId = c.UserId
          LEFT JOIN dbo.OrgAccount Acc WITH (NOLOCK) ON ap.AccountId = Acc.AccountId
          LEFT JOIN  [dbo].[OrgUser] u1 WITH (NOLOCK) ON u1.UserId = ap.[AppraiserUserId]
          LEFT JOIN [dbo].[OrgUser] u2 WITH (NOLOCK) ON u2.UserId = ap.SupervisorUserId and ap.SupervisorAppraisedDate IS NOT NULL
      where ap.UserId is not null and ap.AppraisalStatusId not in (1)
      and (ap.CustomerSubmittedDate is not null)
      order by ap.UpdatedDate desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: appraisal_id {
    type: number
    sql: ${TABLE}.AppraisalId ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.CustomerId ;;
  }

  dimension: appraisal_id_str {
    type: number
    sql: ${TABLE}.AppraisalIdStr ;;
  }

  dimension_group: customer_submitted_date {
    type: time
    sql: ${TABLE}.CustomerSubmittedDate ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.CustomerName ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.Zip ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: vin {
    type: string
    sql: ${TABLE}.Vin ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.Year ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.Make ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.Model ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension: offer_price {
    type: number
    sql: ${TABLE}.offerPrice ;;
  }

  dimension: reserve_estimated_margin {
    type: number
    sql: ${TABLE}.ReserveEstimatedMargin ;;
  }

  dimension_group: updated_date {
    type: time
    sql: ${TABLE}.UpdatedDate ;;
  }

  dimension: appraised_by {
    type: string
    sql: ${TABLE}.AppraisedBy ;;
  }

  dimension: appraised_by_id {
    type: string
    sql: ${TABLE}.AppraisedById ;;
  }

  dimension: submitted_by {
    type: string
    sql: ${TABLE}.SubmittedBy ;;
  }

  dimension: submitted_by_id {
    type: string
    sql: ${TABLE}.SubmittedById ;;
  }

  dimension: is_consumer {
    type: number
    sql: ${TABLE}.IsConsumer ;;
  }

  dimension: is_dealer {
    type: number
    sql: ${TABLE}.IsDealer ;;
  }

  dimension: offer_status {
    type: number
    sql: ${TABLE}.OfferStatus ;;
  }

  dimension_group: dead_deal_date {
    type: time
    sql: ${TABLE}.DeadDealDate ;;
  }

  dimension_group: terminated_date {
    type: time
    sql: ${TABLE}.TerminatedDate ;;
  }

  dimension_group: payment_date {
    type: time
    sql: ${TABLE}.PaymentDate ;;
  }

  dimension_group: offer_released_date {
    type: time
    sql: ${TABLE}.OfferReleasedDate ;;
  }

  dimension_group: offer_accepted_date {
    type: time
    sql: ${TABLE}.OfferAcceptedDate ;;
  }

  dimension: offer_status_id {
    type: number
    sql: ${TABLE}.OfferStatusId ;;
  }

  dimension_group: supervisor_appraised_date {
    type: time
    sql: ${TABLE}.SupervisorAppraisedDate ;;
  }

  set: detail {
    fields: [
      appraisal_id,
      customer_id,
      appraisal_id_str,
      customer_submitted_date_time,
      customer_name,
      city,
      state,
      zip,
      email,
      vin,
      year,
      make,
      model,
      created_date_time,
      offer_price,
      reserve_estimated_margin,
      updated_date_time,
      appraised_by,
      appraised_by_id,
      submitted_by,
      submitted_by_id,
      is_consumer,
      is_dealer,
      offer_status,
      dead_deal_date_time,
      terminated_date_time,
      payment_date_time,
      offer_released_date_time,
      offer_accepted_date_time,
      offer_status_id,
      supervisor_appraised_date_time
    ]
  }
}
